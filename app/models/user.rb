class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # database_authenticatable(パスワードの正確性を検証)
        # registerable(パスワードをリセット)
        # recoverable(ログイン情報を保存)
        # validatable(emailのフォーマットなどのバリエーション)
end
