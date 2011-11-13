module FlashNotice
	def notice(flash_notice)
		page.should have_content(flash_notice)
	end
end
