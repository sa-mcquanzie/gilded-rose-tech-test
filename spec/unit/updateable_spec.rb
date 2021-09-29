# require 'updateable'

# describe Updateable do
#   context 'when another class instance extends it' do
#     class FakeItemClass
#       def initialize(category, sell_in, quality)
#         @category = category
#         @sell_in = sell_in
#         @quality = quality
#       end
#     end

#     let(:fake_item) { FakeItemClass.new(:ordinary, 5, 2) }


#     it 'updates ordinary items' do
#       fake_item.extend(Updateable)
#       puts subject
#       allow(subject).to receive(within_date?).and_return(true)

#       expect(fake_item.update).to eq(4)
#     end
#   end
# end
