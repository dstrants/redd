module Redd
  module Client
    class Authenticated
      module LinksComments
        # @todo return the edited object.
        def add_comment(thing, text, return_element = true)
          fullname = extract_fullname(thing)
          post "/api/comment", api_type: "json", text: text, thing_id: fullname
        end

        alias_method :reply, :add_comment

        def delete(thing)
          fullname = extract_fullname(thing)
          post "/api/del", id: fullname
        end

        # @todo return the edited object.
        def edit(thing, text)
          fullname = extract_fullname(thing)
          post "/api/editusertext",
            api_type: "json", text: text, thing_id: fullname
        end

        def hide(thing)
          fullname = extract_fullname(thing)
          post "/api/hide", id: fullname
        end

        def unhide(thing)
          fullname = extract_fullname(thing)
          post "/api/unhide", id: fullname
        end

        def mark_as_nsfw(thing)
          fullname = extract_fullname(thing)
          post "/api/marknsfw", id: fullname
        end

        def unmark_as_nsfw(thing)
          fullname = extract_fullname(thing)
          post "/api/unmarknsfw", id: fullname
        end

        alias_method :mark_as_safe, :unmark_as_nsfw

        def report(thing)
          fullname = extract_fullname(thing)
          post "/api/report", id: fullname
        end

        def save(thing, category = nil)
          fullname = extract_fullname(thing)
          params = {id: fullname}
          params << {category: category} if category
          post "/api/save", params
        end

        def unsave(thing)
          fullname = extract_fullname(thing)
          post "/api/unsave", id: fullname
        end

        def upvote(thing)
          vote(thing, 1)
        end

        def downvote(thing)
          vote(thing, -1)
        end

        def unvote(thing)
          vote(thing, 0)
        end

        private

        def vote(thing, direction)
          fullname = extract_fullname(thing)
          post "/api/vote", id: fullname, dir: direction
        end
      end
    end
  end
end