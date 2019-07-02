describe Repository, type: :model do
  it "has attributes" do
    test_repository = Repository.new({name: "test", html_url: "test_2"})
    expect(test_repository.name).to eq("test")
    expect(test_repository.url).to eq("test_2")
  end
end
