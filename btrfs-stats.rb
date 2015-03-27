hostname = ENV['HOSTNAME'] || '127.0.0.1'
interval = (ENV['COLLECTD_INTERVAL'] || '10').to_i

def to_bytes(s)
	s.to_i * 1024 ** case s[-1]
		when 'K'
			1
		when 'M'
			2
		when 'G'
			3
	end
end

while true do
	label = 'none'
	File.open('/var/lib/btrfs/show', 'r').each_line do |line|
		if match = line.match(/(?<=Label: ')[^']+/)
			label = match
		elsif match = line.match(/\s*devid\s+\d size (\d*\.?\d+[KMG])i?B used (\d*\.?\d+[KMG])i?B path (\S+)/)
			total = to_bytes match[1]
			used = to_bytes match[2]
			path = match[3]
	    puts "PUTVAL #{hostname}/btrfs-#{label}-#{path.split('/').last}/gauge-bytes-total interval=#{interval} N=#{total}"
	    puts "PUTVAL #{hostname}/btrfs-#{label}-#{path.split('/').last}/gauge-bytes-used interval=#{interval} N=#{used}"
		end
	end
	sleep interval
end
