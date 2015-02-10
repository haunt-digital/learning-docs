class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  acts_as_marker


  def competencies
    # This is just for testing, make real code here
    # not just all competencies some day...
    Competency.all
  end
end
