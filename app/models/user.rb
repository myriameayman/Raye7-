class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
  #attr_accessor :login

   

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :screen_name, :url, :profile_image_url, :location, :description
  # attr_accessible :title, :body


  # Setup accessible (or protected) attributes for your model
      attr_accessible :username, :email, :password, :password_confirmation, :firstName, :lastName,:remember_me, :name, :screen_name, :url, :profile_image_url, :location, :description 
  # attr_accessible :title, :body
      validates :username,
      :presence => true,
      :uniqueness => {
      :case_sensitive => false
      }
      has_one :basic_profile
      has_one :full_profile
      has_many :emails
      has_many :circles
      has_many :requests
      has_many :ratings

      has_many :visits
      has_many :places, through: :visits
      has_one :linkedin_oauth_setting

      validates :firstName, presence: true
      validates :lastName, presence: true

      def self.find_for_database_authentication(warden_conditions)
          conditions = warden_conditions.dup
          if login = conditions.delete(:login)
            where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
          else
            where(conditions.to_h).first
          end
      end
      def self.find_first_by_auth_conditions(warden_conditions)
        conditions = warden_conditions.dup
        if email = conditions.delete(:email)
          User.includes(:emails).where('user_emails.email = ?', email).first
        else
          super(warden_conditions)
        end
      end
    end
