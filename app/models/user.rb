class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :department_key
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, authentication_keys: [:email, :department_key]

  belongs_to :department
  before_validation :department_key_to_id, if: :has_department_key?
  has_attached_file :avatar, styles: {medium: "300*300>", thumb: "100*100>"}
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/jpg image/png)

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    department_key = conditions.delete(:department_key)
    department_id = Department.where(key: department_key).first
    email = conditions.delete(:email)
    # devise認証を、複数項目に対応させる
    if department_id && email
      where(conditions).where(["department_id = :department_id AND email = :email",
        { department_id: department_id, email: email }]).first
    elsif conditions.has_key?(:confirmation_token)
      where(conditions).first
    else
      false
    end
  end

  def full_profile?
    nickname?
  end

  private
  def has_department_key?
    department_key.present?
  end

  def department_key_to_id
    department = Department.where(key: department_key).first_or_create
    self.department_id = department.id
  end


end
