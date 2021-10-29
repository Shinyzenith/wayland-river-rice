function grub-mkconfig --wraps='doas grub-mkconfig -o /boot/grub/grub.cfg' --description 'alias grub-mkconfig=doas grub-mkconfig -o /boot/grub/grub.cfg'
  doas grub-mkconfig -o /boot/grub/grub.cfg $argv
        
end
