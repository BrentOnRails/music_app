class User < ActiveRecord::Base
  attr_reader :password

  validates :password, :length => { :minimum =< 3, :allow_nil => true }
  validates :email, :uniqueness => true, :presence => true

  def reset_session_token!
    generate_session_token
    self.save!
    # self.session_token
    read_attribute(:session_token)
  end

  def password=(secret)
    @password = secret

    # self.password_digest = BCrypt::Password.create(secret)
    write_attribute(:password_digest, BCrypt::Password.create(secret))
  end

  def self.find_by_credentials(params)

  end

  def is_password?(secret)
    BCrypt::Password.new(read_attribute(:password_digest)).is_password?(secret)
  end


  private
  def generate_session_token
    self.session_token = SecureRandom_base64(16)
  end
end
