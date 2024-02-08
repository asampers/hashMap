require './lib/linkedList'

class HashMap
  attr_reader :length

  INITIAL_CAPACITY = 16
  LOAD_FACTOR = 0.75

  def initialize()
    @buckets = Array.new(INITIAL_CAPACITY)
    @length = 0
  end
  
  def set(key, value)
    index = hash_index(key)
    @buckets[index] ||= add_entry(key, value)

    entry = @buckets[index].find(key)

    if entry
      entry.value = value
    elsif load_factor_exceeded?
      grow_hash
      set(key, value) 
    else
      add_node(index, key, value)
    end
  end

  def get(key)
    index = hash_index(key)
    entry = @buckets[index]&.find(key)
    entry&.value
  end

  def has?(key)
    !!get(key)
  end

  def remove(key)
    index = hash_index(key)
    removed = @buckets[index]&.remove(key)
    @length -= 1 if removed

    removed
  end

  def clear
    @buckets = Array.new((INITIAL_CAPACITY))
    @length = 0
  end

  def keys
    entries.map(&:first)
  end

  def values
    entries.map(&:last)
  end

  private
  def entries
    @buckets.each_with_object([]) do |bucket, array| 
      next unless bucket
       bucket.traverse { |entry| array << [entry.key, entry.value]}
    end  
  end

  def current_capacity
    @buckets.size
  end

  def add_entry(key, value)
    @length += 1
    LinkedList.new(key, value)
  end

  def add_node(index, key, value)
    @buckets[index].prepend(key, value)
    @length += 1
  end

  def double_capacity
    @buckets.size * 2
  end

  def load_factor_exceeded?
    (length / current_capacity) > LOAD_FACTOR
  end

  def grow_hash
    old_entries = entries
    @buckets = Array.new(double_capacity)
    @length = 0
    puts "The hash capacity is doubling to #{current_capacity}"
    old_entries.each { |entry| set(entry.first, entry.last)}
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
      
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord } 
    hash_code
  end

  def hash_index(key)
    index = hash(key) % current_capacity
  
    raise IndexError if index.negative? || index >= @buckets.length

    index
  end

end