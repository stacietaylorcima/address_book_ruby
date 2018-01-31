require_relative '../models/address_book'
 
RSpec.describe AddressBook do
	describe "attributes" do
		it "responds to entries" do
			book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
		
		it "initializes entries as an array" do
    	book = AddressBook.new
      expect(book.entries).to be_an(Array)
     end
 
     it "initializes entries as empty" do
       book = AddressBook.new
       expect(book.entries.size).to eq(0)
     end
  end
	
	describe "#add_entry" do
		it "adds only one entry to the address book" do
			book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
      expect(book.entries.size).to eq(1)
    end
 
		it "adds the correct information to entries" do
			book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]
 
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end
	
	describe "#remove_entry" do
		it "removes only one entry from the address book using name, phone_number, and email_address" do
			book = AddressBook.new
      book.add_entry('Stacie Cima', '010.012.2555', 'staciecima@lovelace.com')
 
			name = 'Ada Lovelace'
			phone_number = '010.012.1815'
			email_address = 'augusta.king@lovelace.com'
			book.add_entry(name, phone_number, email_address)
			
      expect(book.entries.size).to eq(2)
			book.remove_entry(name, phone_number, email_address)
			expect(book.entries.size).to eq(1)
			expect(book.entries.first.name).to eq('Stacie Cima')
    end
  end
	
	describe "#demolish" do
		book = AddressBook.new
		it "should delete every entry in AddressBook" do
			book.add_entry('Stacie Cima', '010.012.2555', 'staciecima@gmail.com')
			book.add_entry('Todd Cima', '010.012.2555', 'todd@gmail.com')
		
			book.demolish
			expect(book.entries.size).to eq 0
		end
	end
end