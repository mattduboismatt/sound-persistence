require 'spec_helper.rb'

describe FileParser do

  let(:directory) { Directory.new }

  describe '#initialize' do
    it 'has file property as a string' do
      file_parser = FileParser.new('example/file.txt')
      expect(file_parser.file).to eq 'example/file.txt'
    end
  end

  describe '#add_records_to_directory' do
    context 'with comma delimited records' do
      it 'adds records to directory' do
        file_parser = FileParser.new('spec/spec_lib/spec_comma.txt')
        expect{file_parser.add_records_to_directory(directory)}.to change{directory.users.count}.from(0).to(2)
      end
    end

    context 'with pipe delimited records' do
      it 'adds records to directory' do
        file_parser = FileParser.new('spec/spec_lib/spec_pipe.txt')
        expect{file_parser.add_records_to_directory(directory)}.to change{directory.users.count}.from(0).to(2)
      end
    end

    context 'with space delimited records' do
      it 'adds records to directory' do
        file_parser = FileParser.new('spec/spec_lib/spec_space.txt')
        expect{file_parser.add_records_to_directory(directory)}.to change{directory.users.count}.from(0).to(2)
      end
    end

  end
end

