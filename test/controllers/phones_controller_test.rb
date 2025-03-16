require "test_helper"

class PhonesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/phones.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Phone.count, data.length
  end

  test "create" do
    assert_difference "Phone.count", 1 do
      post "/phones.json", params: { name: "lake", width: 800, height: 600 }
      assert_response 200
    end
  end

  test "show" do
    get "/phones/#{Phone.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal [ "id", "name", "year", "created_at", "updated_at" ], data.keys
  end

  test "update" do
    phone = Phone.first
    patch "/phones/#{phone.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Phone.count", -1 do
      delete "/phones/#{Phone.first.id}.json"
      assert_response 200
    end
  end
end
