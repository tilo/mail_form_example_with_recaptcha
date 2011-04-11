module MailForms
  class ContactController < ::ApplicationController
    def new
      @contact = MailForms::Contact.new
    end

    def create
      @contact = MailForms::Contact.new(params[:mail_forms_contact])   # derived from mail_forms/contact
      @contact.request = request

      respond_to do |format|
        if verify_recaptcha(:model => @contact, :message => 'Invalid reCAPTCHA!' )
          if @contact.deliver   # #deliver is an alias for #save
            format.html { redirect_to new_contact_url,  :notice => "Your message has been sent!" }
          else
            format.html { render :new }
          end
        else
          format.html { redirect_to( contact_path , :flash => { :error => 'Invalid reCAPTCHA!' } ) }
        end
      end
    end
  end
end
