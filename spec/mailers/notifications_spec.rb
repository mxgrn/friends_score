require "rails_helper"

RSpec.describe Notifications, :type => :mailer do
  describe "new_record" do
    let(:mail) { Notifications.new_record }

    it "renders the headers" do
      expect(mail.subject).to eq("New record")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
