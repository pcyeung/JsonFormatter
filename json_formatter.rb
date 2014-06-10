#Teddy's Personal note: use include JsonFormatter for testing

require 'csv'
require 'json'
require 'jbuilder'
module JsonFormatter

  private
  attr_accessor :path #csv path, defined in /app/initializers/csv_path.rb
  attr_accessor :array #2D array of the formatting in each functions in all controller
  attr_accessor :hash_a #convert the 2d array to a 2d hash map with 1st key = controller and 2nd key = method


  #testing paramaters
  attr_accessor :p
  attr_accessor :a
  attr_accessor :a_r
  attr_accessor :test
  attr_accessor :testF

  attr_accessor :t01
  attr_accessor :t02
  attr_accessor :t03
  attr_accessor :t04
  attr_accessor :t05
  attr_accessor :t06
  attr_accessor :t07
  attr_accessor :t08
  attr_accessor :t09
  attr_accessor :t10
  attr_accessor :t11
  attr_accessor :t12
  attr_accessor :t13
  attr_accessor :t14
  attr_accessor :t15
  attr_accessor :t16

  attr_accessor :t01a
  attr_accessor :t02a
  attr_accessor :t03a
  attr_accessor :t04a
  attr_accessor :t05a
  attr_accessor :t06a
  attr_accessor :t07a
  attr_accessor :t08a
  attr_accessor :t09a
  attr_accessor :t10a
  attr_accessor :t11a
  attr_accessor :t12a
  attr_accessor :t13a
  attr_accessor :t14a
  attr_accessor :t15a
  attr_accessor :t16a



  def init
    @p = '../config/json.csv'
    @a = ['1','2','3']
    @b = ['1','2','3','a','b','c','a','b','c','a','b','c']
    @test = ['230', '10', '1', 'apm', '1', 'img', '101','img', '80','img', '5','img', '22',]
    @testF = '/user_check_in_records/create/'

    @t01 = '/users/create/'
    @t02 = '/user/login/'
    @t03 = '/user/me/'
    @t04 = '/user/edit/'
    @t05 = '/sms/send/'
    @t06 = '/sms/verify/'
    @t07 = '/devices/create/'
    @t08 = '/malls/?size=:size'
    @t09 = '/malls/:mallid?size=:size'
    @t10 = '/mall_providers/:mallid?size=:size'
    @t11 = '/providers/:providerid?size=:size'
    @t12 = '/user_check_in_records/create/'
    @t13 = '/prizes/?size=:size'
    @t14 = '/prizes/:prizeid?size=:size'
    @t15 = '/prizes/redeem/'
    @t16 = '/user_prize_histories/:prizeid'

    @t01a = nil
    @t02a = ["aaaaaa", "Teddy", "99999"]
    @t03a = ["Teddy", "99999", "M", "1990/12/13", "HKSAR", "a.jpg"]
    @t04a = ["Teddy", "M", "1990/12/13", "HKSAR", "a.jpg"]
    @t05a = nil
    @t06a = ["aaaaaa"]
    @t07a = nil
    @t08a = ["1", "APM", "KLB", "10", "default.jpg", "1.1", "2.2", "2", "Mega Box", "KLB", "10", "default.jpg", "1.1", "2.2", "3", "Times Square", "CWB", "10", "default.jpg", "1.1", "2.2"]
    @t09a = ["1", "APM", "KLB", "10", "default.jpg"]
    @t10a = ["1", "H&M", "2F", "10", "default.jpg", "2", "Mc Donalds", "3F", "10", "default.jpg"]
    @t11a = ["1", "H&M", "2F", "10", "default.jpg","default.jpg","default.jpg"]
    @t12a = ["230", "10", "1", "H&M", "0", "default.jpg", "10", "default.jpg", "11", "default.jpg", "12", "default.jpg", "13"]
    @t13a = ["1", "APM", "Mc Donalds", "10", "default.jpg","2", "APM", "Mc Donalds", "10", "1", "default.jpg","3", "Candy", "Free Candy", "10", "1", "default.jpg" ]
    @t14a = ["1", "Coffee", "Free Coffee", "10", "1", "default.jpg"]
    @t15a = ["1", "Coffee", "Free Coffee", "qrqrqrqr"]
    @t16a = ["1", "Coffee", "Free Coffee", "0"]


    setup(@p)
  end


  def self.setup (path)
    @path = path
    @array = CSV.read(@path)

    #Delete all array with null values
    @array.each_index do |i|
      @array[i] = @array[i].compact
    end

    #Put the array into a hash table with key = function name
    @hash_a = {}
    @array.each_index do |i|
      @hash_a[@array[i][0]] = @array[i].drop(1) #drop the first attribute which is the key
    end

    #puts "CSV loaded" + "\n" #+ @hash_a.to_json
    return
  end

  ##
  #You should call this function if you want the module to parse the params into the desired format
  #Controller = function calling (i.e. "/malls/:mallid?size=:size")
  #val = an array of values you want to input, accepting any kind of array

  def self.json_success(controller, val)

    #Flatten the array into an 1D array
    #If the array contains nothing, return default success case
    if !val.nil?
      val.flatten(1)
    else
      json = JSON.parse('{"result": "SUCCESS", "VALUE": {}}')
      return json
    end

    #Find the controller registered in the csv table,
    #if nothing found, return default success case
    if hash_a[controller].nil?
      json = JSON.parse('{"result": "SUCCESS", "VALUE": {}}')
      return json
    else
      ##
      #Depreciated Method
      # str = '{"result": "SUCCESS", "VALUE": { "'
      # name_arr = hash_a[controller]
      # name_arr.each_index do |i|
      #   str = str + name_arr[i] + '": '
      #   str = str + '"' + value[i] + '",'
      # end
      # str = str - '",'
      # JSON.parse(str)
      ##


      json = {} #Create an empty object container
      json["result"] = "SUCCESS"
      json["value"] = {}
      name_arr = hash_a[controller] #Put the name attributes into this array

      #Main loop body
      name_arr.each_index do |i|
        if name_arr[i] == '>'
          #putting attr next to '>' as array's attr name
          index_o = i+1
          attr = name_arr[index_o]


          index = index_o + 1

          arr_size = name_arr.length - index_o -1
          arr = []
          tmp_o = {}
          # puts i
          for ii in (i)..(val.length-1)
            #puts "ii= " + ii.to_s + " value[ii]= " + val[ii].to_s
            #puts index.to_s
            tmp_o[name_arr[index]] = val[ii]

            if index > (arr_size + index_o - 1)
              index = index_o+1
              arr.push(tmp_o)
              tmp_o = {}
            else
              index += 1
            end
          end
          json["value"][attr] = arr
          return json
          break
        else
        json["value"][name_arr[i]] = val[i]
        end
      end

      return json
    end
  end


  #You should call this to pass the whole json into the value
  def self.json_success_direct(value)
    json = {
        "result" => "SUCCESS",
        "value" => value
    }

    #json = JSON.parse('{"result": "SUCCESS", "VALUE": ' + value + '}')
    return json

  end


  #You should call this if it is a fail case
  def self.json_fail(value)
    json = JSON.parse('{"result": "FAIL", "VALUE": {"reason": "' + value + '"}}')
    return json
  end

end