module MailForms
  class Contact < ::MailForm::Base

    HowA = ['Friend','Recommendation', 'Link', 'Web Search', 'Other' ]

    SubjectA = []  # you could also pre-define only a given list of Subjects , like in the line above

    attribute :first_name ,:validate => true
    attribute :last_name , :validate => true
    attribute :email,      :validate =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
    attribute :organization                    # Not validated
    attribute :subject , :validate =>  true
    attribute :message , :validate => true
    attribute :how , :validate => HowA         # How did you hear about us? ; validate that it's only one of these values

    append :remote_ip, :user_agent, :session   # append these values to the end of all emails

    def headers
      { :subject => "ContactForm: #{subject}" , 
        :to => 'YOUREMAIL@YOURDOMAIN.COM'  ,   # substitute the email address where you want to receive the form data!
        :from => %("#{first_name} #{last_name}" <#{email}>)
      }
    end
  end
end
