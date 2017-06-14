window.jwl = window.jwl or {}
((shared, $) ->
  
  shared.init_popovers = ->
    window.jwl.shared.open_popovers()
    window.jwl.shared.move_popovers()

  shared.open_popovers = ->
    $(document).off "click", ".full-sized-button.with_action"
    $(document).on "click", ".full-sized-button.with_action", ->
      w_width = $(window).width()
      if w_width < 557
        elem_width = w_width * 0.95
      else if w_width < 895
        elem_width = w_width * 0.75
      else if w_width < 992
        elem_width = w_width * 0.55
      else
        elem_width = w_width * 0.35
      $(".popover-modal.is_open").animate({width: 0}, 500)
      if !$(@).hasClass("skip-removing-classes")
        $(".full-sized-button.white-background").find(".glyphicon").toggleClass("hide")
        $(".full-sized-button.left-shadow").removeClass("left-shadow")
      
      target = $(@).data("popover-target")
      element = "##{target}"
      elem_width = $(".right_options").width()
      skip_checking = false
      if $(@).hasClass("account-button")
        if $("#sign-up-popover").hasClass("is_open") || $("#sign-in-popover").hasClass("is_open")
          skip_checking = true
          $(".popover-modal.is_open").animate({width: 0}, 500)
          $(".popover-modal.is_open").removeClass("left-shadow")
          $(".popover-modal.is_open").removeClass("is_open")
          $(".full-sized-button.white-background").removeClass("white-background")
      if $(element).hasClass("is_open")
        $(element).animate({width: 0}, 500)
        $(element).removeClass("is_open")
        if !$(@).hasClass("skip-removing-classes")
          $(".full-sized-button.white-background").removeClass("white-background")
        $(element).removeClass("left-shadow")
      else if !skip_checking
        $(".popover-modal.is_open").removeClass("is_open")
        $(element).animate({width: elem_width}, 500)
        $(element).addClass("is_open")
        if !$(@).hasClass("skip-removing-classes")
          $(".full-sized-button.white-background").removeClass("white-background")
        $(@).addClass("white-background")
        $(@).find(".glyphicon").toggleClass("hide")
        $(element).addClass("left-shadow")
        if element == "#sign-in-popover"
          $(@).addClass("left-shadow")
      return false
      
  shared.move_popovers = ->
    $(window).on "resize", ->
      window.jwl.shared.set_popover_position()
    $(window).on "load", ->
      window.jwl.shared.set_popover_position()

  shared.set_popover_position = ->
    top_header_size = $("#top-header").height()
    $(".popover-modal").css("top", top_header_size)
) window.jwl.shared = window.jwl.shared or {}, jQuery
