document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelector('.progress-bar')

  if (controls) {
    var questionCount = controls.dataset.questionCount
    var questionNumber = controls.dataset.questionNumber

    controls.style.width = questionNumber / questionCount * 100 + "%"
  }
})
