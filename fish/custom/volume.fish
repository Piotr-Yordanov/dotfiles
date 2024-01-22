function raise_volume
  pulsemixer --change-volume +4
end

function lower_volume
  pulsemixer --change-volume -4
end

function volume_toggle
  pulsemixer --toggle-mute
end
