<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CustomerCareSystem.Dashboard" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="modelPopup" PopupControlID="PanelAdd" CancelControlID="btnClose" ></cc1:ModalPopupExtender>
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="modelPopup" PopupControlID="PanelStatus" CancelControlID="btnClosing" ></cc1:ModalPopupExtender>
    <div class="container" style="padding-top:100px;">
        <h2>List Complaints</h2>
        <asp:GridView ID="GridViewComplaints" CssClass="table table-hover" AllowPaging="true" RowStyle-BorderStyle="Double" HeaderStyle-BorderStyle="Double" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="Action" Visible="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnModalStatus" runat="server" CommandName="Select" OnClick="ModalStatus_Click" CausesValidation="false">
                            <span class="glyphicon glyphicon-edit"></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button runat="server" ID="btnModalAdd" CssClass="btn btn-default btn-sm" Text="Add Complaint" OnClick="ModalAdd_Click" />
        <asp:Button ID="modelPopup" runat="server" style="display:none" />
    </div>


    <asp:Panel ID="PanelAdd" runat="server">
        <div role="dialog" runat="server">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Complaint</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <asp:TextBox runat="server" Rows="3" ID="txtComplaint" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>    
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" ID="btnClose" Text="Close" CssClass="btn btn-default"  CausesValidation="false"/>
                        <asp:Button runat="server" ID="btnAddComplaint" Text="Add" CssClass="btn btn-primary" OnClick="AddComplaint_Click" />
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </asp:Panel>




    <asp:Panel ID="PanelStatus" runat="server">
        <div role="dialog" runat="server">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Complaint</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <h4>ID :<asp:Label ID="lblId" runat="server"></asp:Label></h4>
                            <p></p>
                            <asp:TextBox runat="server" Rows="3" ID="txtShowComplaint" ReadOnly="true" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            <p></p>
                            <select id="selectStatus" runat="server" class="form-control">
                                <option>On Process</option>
                                <option>Finished</option>
                            </select>
                        </div>    
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" ID="btnClosing" Text="Close" CssClass="btn btn-default"  CausesValidation="false"/>
                        <asp:Button runat="server" ID="btnEditStatus" Text="Edit Status" CssClass="btn btn-primary" OnClick="EditStatus_Click" />
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </asp:Panel>


</asp:Content>

