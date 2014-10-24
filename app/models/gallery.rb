class Gallery < ActiveType::Object

  # object fields
  attribute :page, :integer
  attribute :type, :string
  attribute :age, :string
  attribute :state, :string
  attribute :region, :string
  attribute :price, :string
  attribute :time, :integer

  # inner parameters
  attribute :items, :array
  attribute :states, :array
  attribute :number_of_pages, :integer
  attribute :page_number, :integer
  attribute :user_id

  after_initialize :assign_current_user, :prepare_gallery

  private

  def assign_current_user
    self.user_id = User.current.try(:id)
  end

  def prepare_gallery

    self.items = Item.joins(:user).where.not(:user => self.user_id)
    .where(:is_blocked => false)
    .where(:is_active => true)
    .order('items.created_at DESC')
    .where.not(id: User.find(self.user_id).block_items)

    if self.type.present?
      self.items = self.items.where(:type => self.type.split(','))
    end

    if self.age.present?
      self.items = self.items.where(:age => self.age.split(','))
    end

    if self.state.present?
      self.items = self.items.where(:state => self.state.split(','))
    end

    if self.price.present?
      self.items = self.items.where(:price => self.price.split(','))
    end

    if self.region.present?
      self.items = self.items.where(:users => {:region_id => self.region.split(',')})
    end

    if self.time.present?
      case self.time
        when '1'
          self.items = self.items.where(
              'items.created_at >= :one_days_ago',
              :one_days_ago  => Time.now - 1.days,
          )
        when '2'
          self.items = self.items.where(
              'items.created_at >= :week_days_ago',
              :week_days_ago  => Time.now - 7.days,
          )
        when '3'
          self.items = self.items.where(
              'items.created_at >= :month_ago',
              :month_ago  => Time.now - 1.months,
          )
      end
    end

    self.number_of_pages = (self.items.count-1)/AppConfig.max_items_per_page.to_i + 1

    if self.page.nil? || self.page.to_i <= 0
      self.page_number = 1
    elsif self.page.to_i >= self.number_of_pages
      self.page_number = self.number_of_pages
    else
      self.page_number = self.page.to_i
    end

    self.states = User.get_states(self.items)

    self.items = self.items.sort_by { |item| [self.states[item.id], item.created_at] }.reverse!

    self.items = self.items[(self.page_number-1)*AppConfig.max_items_per_page.to_i, AppConfig.max_items_per_page.to_i]

  end

end