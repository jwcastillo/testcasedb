class Assignment < ActiveRecord::Base
  attr_accessible :issues

  belongs_to :product
	belongs_to :version
	belongs_to :test_plan
	belongs_to :schedule
	belongs_to :stencil
	has_many :results, :dependent => :destroy
  has_many :test_cases, :through => :results
  has_one :task, :dependent => :destroy

	accepts_nested_attributes_for :task
  attr_accessible :notes, :product_id, :version_id, :test_plan_id, :stencil_id, :schedule_id, :task_attributes

	validates :product_id, :presence => true
	validates :version_id, :presence => true

  validates_format_of :issues, :with => /^[-a-zA-Z0-9]+([-a-zA-Z0-9,]+)*$/, :allow_nil => true, :allow_blank => true
end
