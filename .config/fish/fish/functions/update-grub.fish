function update-grub --wraps='doas grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias update-grub=doas grub-mkconfig -o /boot/grub/grub.cfg'
  doas grub-mkconfig -o /boot/grub/grub.cfg $argv
        
end
