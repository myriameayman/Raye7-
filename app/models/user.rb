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
<<<<<<< HEAD
      attr_accessible :username, :email, :password, :password_confirmation, :firstName, :lastName,:remember_me, :name, :screen_name, :url, :profile_image_url, :location, :description, :login 
=======
      attr_accessible :username, :email, :password, :password_confirmation, :firstName, :lastName,:remember_me, 
                      :name, :screen_name, :url, :profile_image_url, :location, :description, 
                      :login ,:faceboook_profileimage,:fb_email,:uid,:provider,:oauth_token 
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
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
      has_many :trips


      has_many :visits
      has_many :places, through: :visits
      has_one :linkedin_oauth_setting

      validates :firstName, presence: true
      validates :lastName, presence: true
      devise :database_authenticatable, :registerable,
        :validatable, :authentication_keys => [:login]

<<<<<<< HEAD
=======
      #validates :fb_email ,:presence => true,:uniqueness => {:case_sensitive => false}
      #validates :uid ,:presence => true,:uniqueness => {:case_sensitive => false}
      #validates :oauth_token ,:presence => true,:uniqueness => {:case_sensitive => false}
      
       
 

>>>>>>> c276b045cd32c5897a2360346cc3d56199269709
        def login=(login)
          @login =login
        end
        def login
          @login || self.username || self.email
        end
<<<<<<< HEAD

=======
>>>>>>> c276b045cd32c5897a2360346cc3d56199269709

      def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        if login =conditions.delete(:login)
          where(conditions.to_h).where(["lower(username)= :value OR lower(email) =:value",{:value => login.downcase}]).first
        else
          where(conditions.to_h).firstName
        end
      end
    end

