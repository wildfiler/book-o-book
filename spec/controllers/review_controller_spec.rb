require 'rails_helper'

describe ReviewsController do
  describe 'POST #create' do
    context "when user not signed in" do
      it "redirects to sign in page" do
        post :create, book_id: -1

        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_session_path)
      end
    end

    context "when user signed in" do
      context "review not saved" do
        it "gives error message and redirect to book page" do
          user = create :user
          book = create :book
          sign_in(user)

          post :create, book_id: book.id, review: { comment: '' }

          expect(controller).to set_flash[:warning]
          expect(response).to redirect_to(book)
        end
      end
      context "review saved" do
        it "gives succes flash and redirect to book page" do
          user = create :user
          book = create :book
          sign_in(user)

          post :create, book_id: book.id, review: { comment: 'Some text' }
          
          expect(controller).to set_flash[:notice]
          expect(response).to redirect_to(book)
        end
      end
    end
  end
end
