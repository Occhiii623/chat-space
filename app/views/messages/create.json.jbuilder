json.user_name        @message.user.name
json.created_at       @message.created_at.strftime.to_s(:datetime)
json.content          @message.body
json.image            @message.image.url
json.id               @message.id