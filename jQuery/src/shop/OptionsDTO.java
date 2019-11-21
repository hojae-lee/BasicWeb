package shop;

public class OptionsDTO {

	private String op_idx;
	private String op_name;
	private String op_price;
	private String g_idx;
	
	public OptionsDTO() {}

	public OptionsDTO(String op_idx, String op_name, String op_price, String g_idx) {
		super();
		this.op_idx = op_idx;
		this.op_name = op_name;
		this.op_price = op_price;
		this.g_idx = g_idx;
	}

	public String getOp_idx() {
		return op_idx;
	}

	public void setOp_idx(String op_idx) {
		this.op_idx = op_idx;
	}

	public String getOp_name() {
		return op_name;
	}

	public void setOp_name(String op_name) {
		this.op_name = op_name;
	}

	public String getOp_price() {
		return op_price;
	}

	public void setOp_price(String op_price) {
		this.op_price = op_price;
	}

	public String getG_idx() {
		return g_idx;
	}

	public void setG_idx(String g_idx) {
		this.g_idx = g_idx;
	}
	
	
}
