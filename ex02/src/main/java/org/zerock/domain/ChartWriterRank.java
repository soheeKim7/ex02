package org.zerock.domain;

import java.util.Arrays;

import lombok.Data;

@Data
public class ChartWriterRank {
	private String[] mylabels;
	private int[] mydata;
	
	@Override
	public String toString() {
		return "ChartWriterRank [mylabels=" + Arrays.toString(mylabels) + ", mydata=" + Arrays.toString(mydata) + "]";
	}
}
