document.addEventListener('turbolinks:load', function() {
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password_confirmation) { password_confirmation.addEventListener('input', validatePasswordConfirmation) }
})

function validatePasswordConfirmation() {
  var password = document.getElementById('user_password')

  if (password.value === this.value) {
    this.classList.add('is-valid')
    this.classList.remove('is-invalid')
  } else {
    this.classList.remove('is-valid')
    this.classList.add('is-invalid')
  }
} 
