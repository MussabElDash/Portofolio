jQuery(document).ready ($) ->

	updateNavigation = ->
		contentSections.each ->
			$this = $(this)
			activeSection = $('#cd-vertical-nav a[href="#' + $this.attr('id') + '"]').data('number') - 1
			if $this.offset().top - ($(window).height() / 2) < $(window).scrollTop() and $this.offset().top + $this.height() - ($(window).height() / 2) > $(window).scrollTop()
				navigationItems.eq(activeSection).addClass 'is-selected'
			else
				navigationItems.eq(activeSection).removeClass 'is-selected'
			return
		return

	smoothScroll = (target) ->
		$('body,html').animate { 'scrollTop': target.offset().top }, 600
		return

	$('.start').on 'webkitAnimationEnd oanimationend msAnimationEnd animationend', ->
		$(this).removeClass 'start'
		return
	contentSections = $('.cd-section')
	navigationItems = $('#cd-vertical-nav a')
	updateNavigation()
	$(window).on 'scroll', ->
		updateNavigation()
		return
	#smooth scroll to the section
	navigationItems.on 'click', (event) ->
		event.preventDefault()
		smoothScroll $(@hash)
		return
	#smooth scroll to second section
	$('.cd-scroll-down, .cd-scroll-up').on 'click', (event) ->
		event.preventDefault()
		smoothScroll $(@hash)
		return
	#open-close navigation on touch devices
	$('.touch .cd-nav-trigger').on 'click', ->
		$('.touch #cd-vertical-nav').toggleClass 'open'
		return
	#close navigation on touch devices when selectin an elemnt from the list
	$('.touch #cd-vertical-nav a').on 'click', ->
		$('.touch #cd-vertical-nav').removeClass 'open'
		return
	return