{extends file='layout.zebra.tpl'}

{block name=content}
	{if $stories}
		<div id="story-book">
			{foreach $stories AS $story}
				<div class="story-row">
					<div class="story-voting">
						{if !already_upvoted()}
						<a href="javascript:void(0);" data-story-id="{$story->id}" class="upvote">&#9652;</a>
						{/if}
					</div>
					<div class="story-meat">
						{if $story->external_link}
							<a href="{$story->external_link}" target="_blank">{$story->title}</a> 
							<span class="story-domain">({get_domain($story->external_link)})</span>
						{else}
							<a href="story/{$story->id}/{$story->slug}">{$story->title}</a>
						{/if}
					</div>
				</div>
			{/foreach}
		</div>
	{else}
		<div id="empty-book">
			<p>Sorry, there are no stories to display. Either something broke or nobody has submitted anything yet.</p>
		</div>
	{/if}
{/block}