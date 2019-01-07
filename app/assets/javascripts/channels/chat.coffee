jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  $new_message_form = $('#new-message')
  $new_message_body = $new_message_form.find('#message-body')
  $new_message_chat_id = $new_message_form.find('#message-chat-id')

  if $messages.length > 0
    App.chat = App.cable.subscriptions.create {
      channel: "ChatChannel"
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        if data['message']
          $new_message_body.val('')
          $messages.append data['message']

      send_message: (message, chat_id) ->
        @perform 'send_message', message: message, chat_id: chat_id
        
    $new_message_form.submit (e) ->
      $this = $(this)
      message_body = $new_message_body.val()
      message_chat_id = $new_message_chat_id.val()
      if $.trim(message_body).length > 0
        App.chat.send_message message_body, message_chat_id

      e.preventDefault()
      return false