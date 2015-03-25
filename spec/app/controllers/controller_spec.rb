require 'spec_helper.rb'

describe Controller do

  let(:controller) { Controller.new }

  describe '#initialize' do
    it 'has blank directory property' do
      expect(controller.directory).to be_an_instance_of Directory
      expect(controller.directory.users.count).to eq 0
    end
  end

  describe '#seed' do

    context 'with nil passed as argument' do
      it 'raises ArgumentError' do
        expect{controller.seed(nil)}.to raise_error(ArgumentError, 'Argument must be a directory.')
      end
    end

    context 'with invalid directory passed as argument' do
      it 'raises ArgumentError' do
        expect{controller.seed('example/')}.to raise_error(ArgumentError,"Argument must be a directory.")
      end
    end

    context 'with empty directory passed as argument' do
      it 'raises ArgumentError' do
        expect{controller.seed('spec/empty/')}.to raise_error(ArgumentError, "Directory is empty.")
      end
    end

    context 'with non-empty directory passed as argument' do
      it 'adds users to directory from all files' do
        controller.seed('spec/spec_lib/')
        expect(controller.directory.users.count).to eq 6
      end
    end
  end

  describe '#output' do
    it 'renders all 3 outputs with headers and breaks' do
      output_break = "-"*60+"\n"
      one = output_break+"Output 1 – sorted by gender, then last name ascending\n\n"
      two = output_break+"Output 2 – sorted by birth date, ascending\n\n"
      three = output_break+"Output 3 – sorted by last name, descending\n\n"
      expect{ controller.output }.to output(one+two+three).to_stdout
    end
  end
end
