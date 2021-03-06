package raft;

import raft.net.ssl.SSLChannel;

import java.io.Serializable;
import java.net.InetSocketAddress;
import java.util.UUID;

class RaftServer<T extends Serializable> implements Runnable {
	private Raft<T> raft;
	private SSLChannel channel;

	RaftServer(Raft<T> raft, SSLChannel channel) {
		this.raft = raft;
		this.channel = channel;
	}

	@Override
	public void run() {
		String[] message = channel.receiveString().split("\n");
		
		switch(message[0]) {
		case RPC.callSetValueRPC:
			raft.pool.execute(new RaftRedirect<T>(raft, channel, message[1], RaftCommand.SET));
			break;
		case RPC.callGetValueRPC:
			raft.pool.execute(new RaftRedirect<T>(raft, channel, null, RaftCommand.GET));
			break;
		case RPC.callDeleteValueRPC:
			raft.pool.execute(new RaftRedirect<T>(raft, channel, null, RaftCommand.DELETE));
			break;
		case RPC.callDiscoverNodesRPC:
			String[] address = message[1].split("/");
			UUID ID = UUID.fromString(address[0]);

			raft.clusterLock.lock();
			channel.send(RPC.retDiscoverNodes(raft, ID));
			if (!raft.ID.equals(ID)) {
				// We use putIfAbsent because there may be a conflict of IDs with other servers, so we don't want to erase our probably correct information
				if (raft.cluster.putIfAbsent(ID, new RaftCommunication(raft, channel, new InetSocketAddress(channel.getRemoteAddress().getAddress().getHostAddress(), Integer.valueOf(address[1])))) == null) {
					raft.pool.execute(raft.cluster.get(ID));
					System.out.println(new InetSocketAddress(channel.getRemoteAddress().getAddress().getHostAddress(), Integer.valueOf(address[1]))); // DEBUG
				}
			}
			raft.clusterLock.unlock();
			break;
		}
	}
}
