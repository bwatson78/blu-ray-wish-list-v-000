class User < ApplicationRecord
  # t.string   "email",                  default: "", null: false
  # t.string   "encrypted_password",     default: "", null: false
  # t.string   "reset_password_token"
  # t.datetime "reset_password_sent_at"
  # t.datetime "remember_created_at"
  # t.integer  "sign_in_count",          default: 0,  null: false
  # t.datetime "current_sign_in_at"
  # t.datetime "last_sign_in_at"
  # t.string   "current_sign_in_ip"
  # t.string   "last_sign_in_ip"
  # t.datetime "created_at",                          null: false
  # t.datetime "updated_at",                          null: false
  # t.string   "provider"
  # t.string   "uid"
  # t.index ["email"], name: "index_users_on_email", unique: true
  # t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :user_discs
  has_many :discs, through: :user_discs
  validates :email, :encrypted_password, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
    end
  end


end
