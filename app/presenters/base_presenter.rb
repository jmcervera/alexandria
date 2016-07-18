class BasePresenter

  # Define class level instance variables
  @relations = []
  @sort_attributes = []
  @filter_attributes = []
  @build_attributes = []

  class << self

    # accessor to the class level instance variables
    attr_accessor :relations, :sort_attributes,
                  :filter_attributes, :build_attributes

    def build_with(*args)
      @build_attributes = args.map(&:to_s)
    end

    def related_to(*args)
      @relations = args.map(&:to_s)
    end

    def sort_by(*args)
      @sort_attributes = args.map(&:to_s)
    end

    def filter_by(*args)
      @filter_attributes = args.map(&:to_s)
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
