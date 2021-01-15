class AssignBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @category = @test.category
  end

  def call
    Badge.all.each do |badge|
      if send("#{ badge.awarding_rule }_award?", badge)
        award_user(badge)
      end
    end
  end

  private 

  def completed_category_award?(badge)
    category_tests_ids = Test.by_category(@category.title).pluck(:id).sort
    passed_tests_ids = passed_by_category.pluck(:test_id).uniq.sort

    category_tests_ids == passed_tests_ids
  end

  def with_first_attempt_award?(badge)
    test_passages = TestPassage.where(user: @user, test: @test)
    test_passages.count == 1 && test_passages.first.passed == true
  end

  def completed_level_award?(badge)
    tests_ids = Test.where(level: @test.level).pluck(:id).sort
    passed_tests_ids = passed_by_level.pluck(:test_id).uniq.sort

    tests_ids == passed_tests_ids
  end

  def award_user(badge)
    user_badge = UserBadge.find_by(user: @user, badge: badge)

    if user_badge.present? 
      user_badge.update(awards_counter: user_badge.awards_counter + 1)
    else
      @user.badges << badge
    end
  end

  def passed_by_category
    TestPassage.includes(:user, test: [:category]).where(
      user: @user,
      passed: true,
      tests: { category: @category }
    )
  end

  def passed_by_level
    TestPassage.includes(:user, :test).where(
      user: @user,
      passed: true,
      tests: { level: @test.level }
    )
  end
end
