module Lark
  module Apis
    module Im
      # list all the chat rooms
      def chats(user_access_token:, page_size: nil, page_token: nil)
        get "im/v1/chats", {
          access_token: user_access_token,
          params: {
            page_size: page_size,
            page_token: page_token,
          },
        }.compact
      end

      # get single chat room info
      def chat(chat_id:, user_access_token:)
        get "im/v1/chats/#{chat_id}", {
          access_token: user_access_token,
        }.compact
      end

      # Search chat rooms of user is in
      def search(user_access_token:, query:, page_size: nil, page_token: nil)
        get "im/v1/chats/search", {
          access_token: user_access_token,
          params: {
            query: query,
            page_size: page_size,
            page_token: page_token,
          },
        }.compact
      end

      def add_bot_to_chat_by_user(user_access_token:, chat_id:, member_ids:)
        return if member_ids.blank?

        post "im/v1/chats/#{chat_id}/members?member_id_type=app_id", { "id_list": member_ids }, { access_token: user_access_token }
      end
    end
  end
end
