package com.infinite.can;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "wallet")
public class Wallet {

	@Id
	@Column(name = "wal_id")
	private String walletId;

	@Column(name = "cust_id")
	private String customerId;

	@Column(name = "wal_type")
	@Enumerated(EnumType.STRING)
	private Type walletType;

	@Column(name = "wal_amount")
	private double amt;

	public String getWalletId() {
		return walletId;
	}

	public void setWalletId(String walletId) {
		this.walletId = walletId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public Type getWalletType() {
		return walletType;
	}

	public void setWalletType(Type walletType) {
		this.walletType = walletType;
	}

	public double getAmt() {
		return amt;
	}

	public void setAmt(double amt) {
		this.amt = amt;
	}

	@Override
	public String toString() {
		return "Wallet [walletId=" + walletId + ", customerId=" + customerId + ", walletType=" + walletType + ", amt="
				+ amt + "]";
	}

}
