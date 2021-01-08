CKEDITOR.plugins.add('simplebox', {
    requires: 'widget',
    icons: 'simplebox',
    init: function (editor) {
        // Plugin logic goes here...
        editor.widgets.add('simplebox', {
            // Widget code.
            button: 'Create a simple box',

            allowedContent:
                    'div(!simplebox); p(!simplebox-title); p(!simplebox-content); div(!simplebox-content); div(!simplebox-content2); p(!simplebox-content3)',

            requiredContent: 'div(simplebox)',

            editables: {
                title: {
                    selector: '.simplebox-title'
                },
                content: {
                    selector: '.simplebox-content'
                },
                content2: {
                    selector: '.simplebox-content2'
                },
                content3: {
                    selector: '.simplebox-content3'
                }
            },
            template:
                    '<div class="simplebox">' +

                    '<p class="simplebox-title">Dear <span id="Salutation">[First_Name]</span>,</p>' +

                    '<p class="simplebox-content">This email is being sent to you to validate your Literature Ireland translation grant application system login. To ensure the security of the account information associated with your login, please take a moment to click through the link below and verify that we have assigned the correct email address:</p>' +

                    '<p><u><a href="https://www.literatureirelandgrantapplication.com/publisher.jsp" target="_blank">https://www.literatureirelandgrantapplication.com/publisher.jsp</a></u></p>' +

                    '<div class="simplebox-content2">' +

                    '<p>Please note that if you do not confirm your email address, your login details will eventually be automatically disabled.</p>' +

                    '<p class="simplebox-content2">To log into the system, you can use the following account information:</p>' +
                    
                    '</div>' +

                    '<p>Your login: [LOGIN]</p>' +

                    '<p>Your email address: [EMAILADDRESS]</p>' +

                    '<p>Your interim password: [PASSWORD]</p>' +

                    '<p class="simplebox-content3">Once you have logged in, you may change your password.</p>' +

                    '</div>'

        });
    }
});
