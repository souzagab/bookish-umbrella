RSpec.describe Content, type: :model do

  context "factories" do
    # TODO: Create a shared_example for testing factories
    describe "build" do
      it "builds a valid resource" do
        content = build :content

        expect(content).to be_valid
      end
    end

    describe "create" do
      it "creates a valid content" do
        expect { create :content }.to change { Content.count }
      end
    end

    context "traits" do
      describe "invalid" do
        it "builds a invalid content" do
          content = build :content, :invalid

          expect(content).to be_invalid
        end
      end
    end
  end

  context "relations" do
    it { is_expected.to belong_to(:course) }

    it { is_expected.to have_one_attached :file }
  end

  context "attributes" do
    it { is_expected.to delegate_method(:blob_id).to(:file) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:file) }

    it { is_expected.to validate_attached_of(:file) }
  end
end
