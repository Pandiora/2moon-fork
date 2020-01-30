{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<div id="page">
	<div id="content">
<form action="game.php?page=alliance&amp;mode=admin&amp;action=membersSave" method="post">
<div id="ally_content" class="conteiner">
    <div class="gray_stripe" style="margin-bottom:5px;">
    	{$al_users_list}
		<span style="float:right"><a href="game.php?page=alliance&amp;mode=admin">{$LNG.{$LNG.bu_back}}</a></span>
    </div>
	{if $displayadsmd == 1}
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- War Of Galaxyz #Game -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-2369063859511778"
     data-ad-slot="3349807407"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>{/if}
    <table id="memberList" class="tablesorter ally_ranks gray_stripe_th">
        <thead>
            <tr>
                <th style="border-left:0; padding-left:15px; text-align:left;">
                	<a href="game.php?page=alliance&amp;mode=admin&amp;action=members&amp;sort=name">{$LNG.al_member}</a>
                </th>
                <th></th>
                <th>
                	<a href="game.php?page=alliance&amp;mode=admin&amp;action=members&amp;sort=rank">{$LNG.al_position}</a>
                </th>
                <th>
                	<a href="game.php?page=alliance&amp;mode=admin&amp;action=members&amp;sort=points">{$LNG.al_points}</a>
                </th>
                <th>
					{$LNG.al_coords}
                </th>
                <th>
                	<a href="game.php?page=alliance&amp;mode=admin&amp;action=members&amp;sort=reg_time">{$LNG.al_member_since}</a>
                </th>
                <th>
                	<a href="game.php?page=alliance&amp;mode=admin&amp;action=members&amp;sort=online">{$LNG.al_estate}</a>
                </th>
                <th></th>
            </tr>
        </thead>
        <tbody>
		{foreach $memberList as $userID => $memberListRow}
                <tr>
            <td style="text-align:left; padding-left:15px;"><a href="#" onclick="return Dialog.Playercard({$userID},'{$memberListRow.username}');">{$memberListRow.username}</a></td>
            <td style="text-align:center;"><a href="#" onclick="return Dialog.PM({$userID});" class="batn_lincks mesages" style="height:15px; float:none; padding-left:15px; margin-left:5px;"></a></td>
            <td>{if $memberListRow.rankID == -1}{$founder}{elseif isset($rankList[$memberListRow.rankID])}{html_options name="rank[{$userID}]" options=$rankList selected=$memberListRow.rankID}{else}{$rankList[$memberListRow.rankID]}{/if}</td>
            <td><span title="{$memberListRow.points|number}">{$memberListRow.points|number}&nbsp;</span></td>
            <td><a href="game.php?page=galaxy&amp;galaxy={$memberListRow.galaxy}&amp;system={$memberListRow.system}">[{$memberListRow.galaxy}:{$memberListRow.system}:{$memberListRow.planet}]</a></td>
            <td><a class="tooltip" data-tooltip-content="{$LNG.last_activity}: {$memberListRow.onlinetime1}">{$memberListRow.register_time}</a></td>
			
            <td>
             {if $rights.ONLINESTATE}{if $memberListRow.onlinetime < 4}<span style="color:#009e4a">{$LNG.al_memberlist_on}</span>{elseif $memberListRow.onlinetime <= 15}<span style="color:#9e9100">{$memberListRow.onlinetime} {$LNG.al_memberlist_min}</span>{else}<span style="color:red">{$LNG.al_memberlist_off}</span>{/if}{else}-{/if}
            </td>
            <td>
			
			<input style=" border:0; background:0; padding:0;" src="styles/images/true.png" alt=""  border="0" type="image">
			{if $canKick}
            <a href="game.php?page=alliance&amp;mode=admin&amp;action=membersKick&amp;id={$userID}" onclick="return confirm('{$memberListRow.kickQuestion}');" style=" float:right; margin-right:5px">
            	<img src="styles/images/false.png" alt="" border="0"></a>{/if}
			
			
                        </td>
        </tr>{/foreach}
                </tbody>
    </table>
</div>
</form>
</div>
</div>
            <div class="clear"></div>   
            </div>         
        </div><!--/body-->
{/block}
{block name="script" append}
<script src="scripts/base/jquery.tablesorter.js"></script>
<script>$(function() {
    $("#memberList").tablesorter({
		headers: { 
			0: { sorter: false } ,
			3: { sorter: false } ,
			9: { sorter: false }
		},
		debug: false
	}); 
});</script>
{/block}