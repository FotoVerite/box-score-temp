require 'spec_helper'

describe Post do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }

  describe ".excerpt" do
    let(:post) { create(:post) }

    it "returns the excerpt when it exists" do
      expect(post.excerpt).to eq post.excerpt
    end

    it "returns the first 200 characters if the excerpt is missing" do
      post.update_attributes(
        excerpt: nil,
        body: <<EOT.squish
Lorem ipsum dolor sit amet, iusto qualisque mel in, mazim invidunt intellegebat
 ne pro. Simul dissentiunt ei sed, eam partem perpetua convenire eu. Ex paulo
 omnesque usu, eos delectus singulis efficiendi in. Quo detraxit atomorum
 accommodare ut. His ex tantas quodsi partiendo. Et dictas omnesque mea, has
 putant qualisque ea, no duo oporteat singulis.
EOT
      )
      expect(post.excerpt).to eq <<EOT.squish
Lorem ipsum dolor sit amet, iusto qualisque mel in, mazim invidunt intellegebat
 ne pro. Simul dissentiunt ei sed, eam partem perpetua convenire eu. Ex paulo
 omnesque usu, eos delectus singulis efficien...
EOT
    end
  end
end
