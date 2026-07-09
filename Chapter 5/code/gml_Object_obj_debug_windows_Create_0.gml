xx = mouse_x - 40
yy = mouse_y - 20
xx = clamp(xx, 40, 520)
yy = clamp(yy, 40, 340)
type = 0
button_text[0] = "Drag Window!"
event_user(15)
watchvar = " "
watchflag = -1
for (i = 0; i < button_amount; i++)
{
    button_state[i] = 0
    button_clicked[i] = 0
}
// new way of dragging
relxx = 0;
relyy = 0;