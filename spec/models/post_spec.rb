# == Schema Information
#
# Table name: posts
#
#  id                        :integer          not null, primary key
#  title                     :string(255)
#  body                      :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  excerpt                   :text
#  game_id                   :integer
#  header_image_file_name    :string(255)
#  header_image_content_type :string(255)
#  header_image_file_size    :integer
#  header_image_updated_at   :datetime
#  email                     :boolean          default(FALSE), not null
#  admin_id                  :integer
#  slug                      :string
#

require 'rails_helper'

describe Post do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
  it { should belong_to(:game) }

  describe '.excerpt' do
    let(:post) { create(:post) }

    it 'returns the excerpt when it exists' do
      expect(post.excerpt).to eq post.excerpt
    end

    it 'returns the first 200 characters if the excerpt is missing' do
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
 omnesque usu, eos delectus singulis effi...
EOT
    end

    it 'returns the whole body if the body is less than 200 characters' do
      post.update_attributes(excerpt: nil, body: '<p>Hello</p>')
      expect(post.excerpt).to eq 'Hello'
    end
  end
end
