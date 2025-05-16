using {cuid , managed ,Currency} from '@sap/cds/common';

namespace training.db;

type ISBN:String(13);

type address : {
    address : String;
    pincode : Integer
}

entity Books : cuid, managed{
    title: String;
    ISBN : ISBN;
    amount : Currency;
    review : String; 
    author : Association to Author;
}

entity Author :  cuid {
    authorName: String;
    ISBN : ISBN;
    address : address;
    book_c : Composition of many Books on book_c.ISBN = $self.ISBN;    
}

entity Review :  cuid, managed {
    rating: Integer;
    comment: String;
    book: Association to Books;
}
