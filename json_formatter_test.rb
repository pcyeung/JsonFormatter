
class JsonFormatterClass
  include JsonFormatter
end

class JsonFormatterTest < Test::Unit::TestCase

  setup do
    JsonFormatterClass.setup ('json_test.csv')
  end

  #Todo: ADD/UPDATE functions list accordingly before test when updating the csv



  #Testing functions
  @t01 = '/users/create/'
  @t02 = '/user/login/'
  @t03 = '/user/me/'
  @t04 = '/user/edit/'
  @t05 = '/sms/send/'
  @t06 = '/sms/verify/'
  @t07 = '/devices/create/'
  @t08 = '/malls/?size=:size'
  @t09 = '/malls/:mallid?size=:size'
  @t10 = '/providers/:providerid?size=:size'
  @t11 = '/user_check_in_records/create/'
  @t12 = '/prizes/?size=:size'
  @t13 = '/prizes/:prizeid?size=:size'
  @t14 = '/prizes/redeem/'
  @t15 = '/user_prize_histories/?size=:size'
  @t16 = '/user_prize_histories/:prizeid'

  #Testing variables
  @username = 'John Doe'
  @userpoints = '220'
  @sex = 'M'
  @usertoken = 'hCW79yFQsHvgx17Uz9Ba'
  @userlocation = 'Beijing/District1'
  @image = '/image/.../icon_s.jpg'
  @birthdate = '2001-02-03T00:00:00+00:00'
  @id = 'id'
  @mallname = 'APM'
  @malllocation = '中國北京市东城区王府井大街138号'
  @providername = 'Mc Donalds'
  @providerlocation = 'Shop 202'
  @providerpoints = '10'
  @prizename = 'Coffee'
  @prizedesc = 'Free coffee from Json!'
  @prizepoint = '50'
  @lat = '39.91385'
  @long = '116.411863'
  @isaffordable = '1'
  @qr = 'userid=1,prizeid=1'


  #Testing input
  @t01v = nil
  @t02v = [@usertoken]
  @t03v = [@username, @userpoints, @sex, @birthdate, @userlocation, @image]
  @t04v = [@username, @sex, @birthdate, @userlocation,@image]
  @t05v = nil
  @t06v = [@usertoken]
  @t07v = nil
  @t08v = [
            [@id, @mallname, @malllocation, @providerpoints, @image, @lat, @long],
            [@id, @mallname, @malllocation, @providerpoints, @image, @lat, @long],
            [@id, @mallname, @malllocation, @providerpoints, @image, @lat, @long]
          ]
  @t09v = [@id,@mallname,@malllocation,@image,[@id,@providername,@providerlocation,@providerpoints,@image],[@id,@providername,@providerlocation,@providerpoints,@image],[@id,@providername,@providerlocation,@providerpoints,@image]]
  @t10v = [@id,@providername,@providerlocation,@providerpoints,@image,@image,@image,@image,@image,@image]
  @t11v = [@userpoints,@providerpoints,@providername,'0',[@image,@id],[@image,@id],[@image,@id],[@image,@id]]
  @t12v = [[@id,@prizename,@mallname,@providername,@prizename,@image],[@id,@prizename,@mallname,@providername,@prizename,@image],[@id,@prizename,@mallname,@providername,@prizename,@image],[@id,@prizename,@mallname,@providername,@prizename,@image]]
  @t13v = [@id,@prizename, @prizedesc, @prizepoint, @isaffordable, @image]
  @t14v = [@id, @prizename, @prizedesc, @qr]
  @t15v = [@id, @prizename, @mallname, @providername, '0', @image]
  @t16v = [@id, @prizename, @prizedesc, '0', @qr]

  #Testing output
  @t01o = nil
  @t02o = []
  @t03o = []
  @t04o = []
  @t05o = nil
  @t06o = ['']
  @t07o = nil
  @t08o = []
  @t09o = []
  @t10o = []
  @t11o = []
  @t12o = []
  @t13o = []
  @t14o = []
  @t15o = []
  @t16o = []



  test "Fail Cases" do
    json_fail('Reason')
  end

  test "something" do
    JsonFormatterClass.json_success(@t01, @t01o)
  end
end
