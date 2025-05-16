using { training.db as db } from '../db/schema';


service BookStoreService  @(path: 'BookStoreAman')  {
    @odata.draft.enabled
    entity Books as projection on db.Books;
    entity Authors as projection on db.Author;
    entity Reviews as projection on db.Review;

    entity BooksWithReviews as SELECT from db.Books as b
    LEFT JOIN db.Review as r ON r.book.ID = b.ID {
        key b.ID,
        b.ISBN,
        b.amount,
        b.createdAt,
        b.createdBy,
        b.modifiedAt,
        b.modifiedBy,
        r.ID as review_ID,
        r.rating,
        r.comment,
        r.createdAt as review_createdAt,
        r.createdBy as review_createdBy,
        r.modifiedAt as review_modifiedAt,
        r.modifiedBy as review_modifiedBy
    };

    action readBook();
    function getPopularBook() returns Books;
}
