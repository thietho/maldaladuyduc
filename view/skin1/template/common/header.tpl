<div id="ben-header">
    <div id="ben-top">
        <div class="ben-left" id="ben-logo">
            <a href="<?php echo HTTP_SERVER?>"><img src="<?php echo HTTP_SERVER.DIR_IMAGE?>logo.png" alt="Logo" title="logo"/></a>
        </div>
    	
       
    	
        
        <div class="ben-right" id="ben-header-search">
        	<table>
            	<tr>
                	<td>
                    	<input class="ben-textbox" type="text" value="Tìm kiếm" style="width:221px;"/>
                    </td>
                    <td>
                    	<img src="<?php echo HTTP_SERVER.DIR_IMAGE?>btn-search.png"/>
                    </td>
                </tr>
            </table>
        </div>
        <div class="clearer">&nbsp;</div>
        
        
        
    </div>
    <div id="ben-mobile-menu">
        <img src="<?php echo HTTP_SERVER.DIR_IMAGE?>iconmenu.png">
        <div class="ben-navigation-mobile">
            <ul id="ben-main-nav-mobile">
                <?php echo $mainmenu?>
            </ul>

        </div>
    </div>
    <div id="ben-main-menu">
        <div class="ben-navigation">
            
            <ul id="ben-main-nav">
                <?php echo $mainmenu?>
            </ul>
    
            <div class="clearer">&nbsp;</div>
    
        </div>    	
    </div>
</div>

<script src="<?php echo HTTP_SERVER.DIR_JS?>menu.js" language="javascript"></script>