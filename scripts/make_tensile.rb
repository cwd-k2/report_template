#!/usr/bin/env ruby

require_relative '../root.rb'

material_cross = {
  'Al'     =>  9.81,
  'Mg'     => 10.80,
  'Ti'     =>  9.68,
  'Fe炉冷' =>  9.81,
  'Fe水冷' =>  9.59,
  'PET'    => 10.49,
}

exec =
  case ARGV[0]
  when 'true'
    PROJECT_ROOT / 'scripts' / 'tensile_true.py'
  when 'true_log'
    PROJECT_ROOT / 'scripts' / 'tensile_true_log.py'
  else
    PROJECT_ROOT / 'scripts' / 'tensile.py'
  end

FileUtils.mkdir_p PROJECT_ROOT / 'resources' / 'tensile'

material_cross.each { |material, cross|
  file = PROJECT_ROOT / 'resources' / 'tensile_test' / "#{material}.csv"
  spawn "cat #{file} | nkf -w | PROJECT_ROOT=#{PROJECT_ROOT} python3 #{exec} #{material} #{cross}"
}
