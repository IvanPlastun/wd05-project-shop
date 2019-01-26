$(document).ready(function() {
	
	/*(function() {
		const formValidation = {

			$form: $('#registration-form'),
			pattern: /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z{2,4}\.])?[a-z]{2,4}$/i,
			isValid: false,

			init: function() {
				this._setUpListeners();
			},

			_setUpListeners: function() {
				$(this.$form).on('submit', this._validateForm);
			},

			_validateForm: function(event) {
				event.preventDefault();
				const notifyBox = $('<div class="notification"></div>');

				//Получаем значения полей email и пароль
				const email = $('#input-reg-email').val().trim();
				const password = $('#input-reg-password').val().trim();
				let isValidEmail = false, isValidPassword = false;

				//функция, которая будет создавать сообщения нотификаций
				function createNotify(notifyBox, notifyText, selector, desc = false, descriptionText = '') {
					const notifyError = document.createElement('div');
					const descriptionBox = document.createElement('div');
					const errorClass = 'notification__title notification--error';
					const notifyDescClass = 'notification--with-description'; 
					const descriptionBoxClass = 'notification__description';


					if(!desc) { 
						notifyError.className = errorClass + ' mb-10';
						notifyError.append(notifyText);
						notifyBox.append(notifyError);
						$(selector).find('.notification').remove();
						$(selector).prepend(notifyBox);
					} else if(desc && descriptionText != '') {
						notifyError.className = `${errorClass} ${notifyDescClass}`;
						notifyError.append(notifyText);
						descriptionBox.className = descriptionBoxClass;
						descriptionBox.innerHTML = descriptionText;
						notifyBox.append(notifyError);
						notifyBox.append(descriptionBox);
						$(selector).find('.notification').remove();
						$(selector).prepend(notifyBox);						
					}
				}

				if(email.length == 0 && !isValidEmail) {
					createNotify(notifyBox, 'Введите email', '#registration-form');
				} else {
					if(!formValidation.pattern.test(email)) {
						createNotify(notifyBox, 'Неверный формат email', '#registration-form');
					} else {
						isValidEmail = true;
						const errorMessageEmail = $('#registration-form').find('.notification .notification__title')[0];
						$(errorMessageEmail).remove();
					}
				}

				if(password.length == 0 && !isValidPassword) {
					createNotify(notifyBox, 'Введите пароль', '#registration-form');
				} else {
					isValidPassword = true;
					const errorMessagePassword = $('#registration-form').find('.notification .notification__title')[1];
					$(errorMessagePassword).remove();
				}

				formValidation.isValid = isValidEmail && isValidPassword;

				if(formValidation.isValid) {
					const formData = new FormData($(this)[0]);
					formData.append('register', 'Регистрация');
					$.ajax({
						type: $('#registration-form').attr('method'),
						url: $('#registration-form').attr('action'),
						data: formData,
						success: function (response) {
							
						},
						cache: false,
						contentType: false,
						processData: false
					});
				}
			}
		}

		formValidation.init();
	})();*/

	$('[data-notify-hide]').delay(2000).slideUp(500);
});