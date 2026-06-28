event_inherited()
if (debug_only)
{
	if (!scr_debug())
	{
		instance_destroy()
		exit
	}
	//visible = 0
	image_blend = c_red
}
blocks = []
myinteract = 0
mode = obj_platswap.mode
timer = 0
timer_max = obj_platswap.transition_timemax
hit = 0
can_hit = 1
image_index = 0
image_speed = 0
shinealpha = 0
shinetimer = 0
platinit = false
image_xscale = 2
image_yscale = 2
pal_sprite = spr_pal_moss
pal_index = 0
force_yplat = false
y_plat = -1
yscale_plat = -1
y_ow = -1
yscale_ow = -1
ignore_yorigin = -1
wings = -1
sprite_index = spr_platswap_statue_top_new
reflect_jump_y = sprite_height + 10
floortex = -1
dismount = function()
{
	scr_plat_susie_attack_fast(self, true)
}
if (floating)
{
}
