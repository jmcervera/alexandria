class BasePresenter

  # Define a class level instance variable
  @build_attributes = []

  class << self

    # accessor to the class level instance variable
    attr_accessor :build_attributes

    def build_with(*args)
      @build_attributes = args.map(&:to_s)
    end
  end
  attr_accessor :object, :params, :data

  def initialize(object, params)
    @object = object
    @params = params
    @data = HashWithIndifferentAccess.new
  end

  def as_json(*)
    @data
  end

end
